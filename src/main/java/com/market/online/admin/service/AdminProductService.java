package com.market.online.admin.service;

import com.market.online.dto.ProductDTO;
import com.market.online.entity.Product;
import com.market.online.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class AdminProductService {

    @Autowired
    private ProductRepository productRepository;

    public Page<Map<String, Object>> getDataPage(ProductDTO search){
        return productRepository.getDataPage(search, search.pageable());
    }

    public Product getOne(Integer id){
        return productRepository.findById(id).get();
    }

    public void update(Product product){
        Product productTmp = getOne(product.getId());
        productTmp.setIdStatus(product.getIdStatus());
        productTmp.setPriceVerify(product.getPriceVerify());
        productTmp.setIdConfirmer(1);
        productRepository.save(productTmp);
    }
}
