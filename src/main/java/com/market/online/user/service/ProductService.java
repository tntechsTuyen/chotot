package com.market.online.user.service;

import com.market.online.dto.ProductDTO;
import com.market.online.entity.*;
import com.market.online.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private PostRepository postRepository;

    @Autowired
    private PostMetaRepository postMetaRepository;

    @Autowired
    private FileService fileService;

    @Autowired
    private MediaRepository mediaRepository;

    @Autowired
    private PostMediaRepository postMediaRepository;

    public Product create(ProductDTO productDTO){
        //Create Product
        Product product = new Product(productDTO);
        product.setIdUser(1);
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

    public List<Map<String, Object>> getFeaturedProducts(){
        return productRepository.getDataFeaturedProducts();
    }
}
