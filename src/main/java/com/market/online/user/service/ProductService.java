package com.market.online.user.service;

import com.market.online.dto.ProductDTO;
import com.market.online.entity.*;
import com.market.online.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private PostService postService;

    @Autowired
    private PostRepository postRepository;

    @Autowired
    private PostUserService postUserService;

    @Autowired
    private PostMetaRepository postMetaRepository;

    @Autowired
    private FileService fileService;

    @Autowired
    private MediaRepository mediaRepository;

    @Autowired
    private PostMediaRepository postMediaRepository;

    @Autowired
    private UserService userService;

    public Product create(HttpServletRequest request, ProductDTO productDTO){
        User userInfo = userService.getUserLogin(request);
        Integer idUser = (userInfo != null) ? userInfo.getId() : 0;

        //Create Product
        Product product = new Product(productDTO);
        product.setIdUser(idUser);
        product.setIdStatus(5);
        productRepository.save(product);
        //Create Post
        Post post = new Post(product);
        post.setContent(productDTO.getContent());
        postRepository.save(post);
        //Create Media + Post Media
        List<String> urls = new ArrayList<>();
        if(productDTO.getMedia().length > 0){
            urls = fileService.updloadFiles(productDTO.getMedia());
            for(int i = 0; i < urls.size(); i++){
                Media m = new Media(urls.get(i), "IMG");
                mediaRepository.save(m);
                postMediaRepository.save(new PostMedia(post.getId(), m.getId(), (i==0) ? 3 : 4));
            }
        }
        //Create Post Meta
        if(productDTO.getMetaKey().size() > 0){
            for(int i = 0; i < productDTO.getMetaKey().size(); i++){

                postMetaRepository.save(new PostMeta(post.getId(), productDTO.getMetaKey().get(i), productDTO.getMetaName().get(i), productDTO.getMetaValue().get(i)));
            }
        }
        return product;
    }

    public void update(ProductDTO productDTO){
        //Update product
        Product productRaw = getOne(productDTO.getId());
        productRaw.setName(productDTO.getName());
        productRaw.setPrice(productDTO.getPrice());
        productRepository.save(productRaw);

        //Update post
        Post postRaw = postService.getByProduct(productDTO.getId());
        postRaw.setContent(productDTO.getContent());
        postRepository.save(postRaw);

        //Update post meta
        if(productDTO.getMetaId().size() > 0){
            for(int i = 0; i < productDTO.getMetaId().size(); i++){
                PostMeta metaRaw = postMetaRepository.findById(productDTO.getMetaId().get(i)).get();
                metaRaw.setValue(productDTO.getMetaValue().get(i));
                postMetaRepository.save(metaRaw);
            }
        }
    }

    public void delete(Integer idProduct){
        Product productRaw = getOne(idProduct);

        Post postRaw = postService.getByProduct(idProduct);

        List<PostMeta> metas = postMetaRepository.findByIdPost(postRaw.getId());
        metas.forEach((el) -> {
            postMetaRepository.delete(el);
        });

        List<PostMedia> medias = postMediaRepository.selectByIdPost(postRaw.getId());
        medias.forEach((el) -> {
            postMediaRepository.delete(el);
        });

        postRepository.delete(postRaw);
        productRepository.delete(productRaw);
    }

    public List<Map<String, Object>> getFeaturedProducts(HttpServletRequest request){
        User userInfo = userService.getUserLogin(request);
        Integer idUser = (userInfo != null) ? userInfo.getId() : 0;
        return productRepository.getDataFeaturedProducts(idUser);
    }

    public Product getOne(Integer id){
        return productRepository.findById(id).get();
    }

    public List<Map<String, Object>> getDataByIdCategory(HttpServletRequest request, Integer idCategory){
        User userInfo = userService.getUserLogin(request);
        Integer idUser = (userInfo != null) ? userInfo.getId() : 0;
        return productRepository.getDataByIdCategory(idCategory, idUser);
    }

    public List<Map<String, Object>> getDataViewed(HttpServletRequest request){
        User userInfo = userService.getUserLogin(request);
        if(userInfo != null){
            return productRepository.getDataViewed(userInfo.getId());
        }
        return new ArrayList<>();
    }

    public List<Map<String, Object>> getMyData(HttpServletRequest request, Integer idStatus){
        User userInfo = userService.getUserLogin(request);
        Integer idUser = (userInfo != null) ? userInfo.getId() : 0;
        return productRepository.getMyData(idUser, idStatus);
    }

    public List<Map<String, Object>> getList(HttpServletRequest request, ProductDTO productDTO){
        User userInfo = userService.getUserLogin(request);
        if(userInfo != null){
            productDTO.setIdUser(userInfo.getId());
        }
        return productRepository.getList(productDTO);
    }

    public Page<Map<String, Object>> getPage(HttpServletRequest request, ProductDTO productDTO){
        User userInfo = userService.getUserLogin(request);
        if(userInfo != null){
            productDTO.setIdUser(userInfo.getId());
        }
        return productRepository.getPage(productDTO, productDTO.pageable());
    }
}
