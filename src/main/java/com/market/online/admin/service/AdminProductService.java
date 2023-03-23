package com.market.online.admin.service;

import com.market.online.dto.ProductDTO;
import com.market.online.entity.Category;
import com.market.online.entity.Product;
import com.market.online.entity.User;
import com.market.online.repository.ProductRepository;
import com.market.online.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Service
public class AdminProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserService userService;

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

    public void updateProductStatus(HttpServletRequest request, ProductDTO productDTO){
        if(productDTO.getProductSelect() != null && productDTO.getProductSelect().size() > 0){
            User userInfo = userService.getUserLogin(request);
            productRepository.updateStatusForProducts(productDTO.getProductSelect(), userInfo.getId(), 6);
        }
    }

    public Product locked(Integer id){
        Product productInfo = this.getOne(id);
        if(productInfo.getIsLocked() == 2) return null;
        productInfo.setIsLocked(2);
        productRepository.save(productInfo);
        return productInfo;
    }

    public Product unlocked(Integer id){
        Product productInfo = this.getOne(id);
        if(productInfo.getIsLocked() == 1) return null;
        productInfo.setIsLocked(1);
        productRepository.save(productInfo);
        return productInfo;
    }
}
