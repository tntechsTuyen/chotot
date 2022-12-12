package com.market.online.user.service;

import com.market.online.dto.ProductDTO;
import com.market.online.entity.Media;
import com.market.online.entity.Post;
import com.market.online.entity.PostMedia;
import com.market.online.entity.Product;
import com.market.online.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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
            urls.forEach((el) -> {
                Media m = new Media(el, "IMG");
                mediaRepository.save(m);
                postMediaRepository.save(new PostMedia(post.getId(), m.getId()));
            });
        }
        //Create Post Meta
        if(productDTO.getMetaKey().size() > 0){
            
        }
        return product;
    }
}
