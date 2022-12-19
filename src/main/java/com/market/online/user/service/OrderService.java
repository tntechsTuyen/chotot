package com.market.online.user.service;

import com.market.online.dto.OrderDTO;
import com.market.online.entity.Order;
import com.market.online.entity.OrderHistory;
import com.market.online.entity.Product;
import com.market.online.entity.User;
import com.market.online.repository.OrderHistoryRepository;
import com.market.online.repository.OrderRepository;
import com.market.online.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderHistoryRepository orderHistoryRepository;

    @Autowired
    private UserService userService;

    public Order getOne(Integer id){
        return orderRepository.findById(id).get();
    }

    public Order getByIdRedirect(Integer idRedirect){
        return orderRepository.findByIdRedirect(idRedirect).get();
    }

    public List<Map<String, Object>> getMyOrder(OrderDTO search){
        return orderRepository.getMyList(search);
    }

    public boolean create(HttpServletRequest request, OrderDTO orderDTO){
        Product productInfo = productService.getOne(orderDTO.getIdProduct());
        User userInfo = userService.getUserLogin(request);
        if(productInfo.getIdStatus() == 6 && !userInfo.getId().equals(productInfo.getIdUser())){
            Order order = new Order();
            order.setIdSeller(productInfo.getIdUser());
            order.setIdBuyer(userInfo.getId());
            order.setIdProduct(productInfo.getId());
            order.setIdType(orderDTO.getIdType());
            order.setPrice(productInfo.getPrice());
            orderRepository.save(order);

            productInfo.setIdStatus(8);
            productRepository.save(productInfo);

            OrderHistory orderHistory = new OrderHistory();
            orderHistory.setIdOrder(order.getId());
            orderHistory.setIdUser(order.getIdBuyer());
            orderHistory.setIdStatus(order.getIdStatus());
            orderHistoryRepository.save(orderHistory);

            if(orderDTO.getIdType() == 2){
                Product productSwapInfo = productService.getOne(orderDTO.getIdProductSwap());
                Order orderSwap = new Order();
                orderSwap.setIdSeller(order.getIdBuyer());
                orderSwap.setIdBuyer(order.getIdSeller());
                orderSwap.setIdProduct(orderDTO.getIdProductSwap());
                orderSwap.setPrice(productSwapInfo.getPrice() - productInfo.getPrice());
                orderSwap.setIdRedirect(order.getId());
                orderSwap.setIdType(orderDTO.getIdType());
                orderRepository.save(orderSwap);
                order.setPrice(productInfo.getPrice() - productSwapInfo.getPrice());
                orderRepository.save(order);

                OrderHistory orderSwapHistory = new OrderHistory();
                orderSwapHistory.setIdOrder(orderSwap.getId());
                orderSwapHistory.setIdUser(orderSwap.getIdBuyer());
                orderSwapHistory.setIdStatus(orderSwap.getIdStatus());
                orderHistoryRepository.save(orderSwapHistory);
            }
        }
        return false;
    }

    /**
     * 1 -> 2 -> 3 -> 4: Pass
     * 10: Cancel
     * */
    public boolean update(HttpServletRequest request, OrderDTO orderDTO){
        User userInfo = userService.getUserLogin(request);
        Order orderInfo = getOne(orderDTO.getId());
        if(orderDTO.getValue() == 1){
            orderInfo.setIdStatus(orderInfo.getIdStatus()+1);
        }else{
            orderInfo.setIdStatus(10);
        }
        orderRepository.save(orderInfo);

        OrderHistory orderHistory = new OrderHistory();
        orderHistory.setIdOrder(orderInfo.getId());
        orderHistory.setIdUser(userInfo.getId());
        orderHistory.setIdStatus(orderInfo.getIdStatus());
        orderHistoryRepository.save(orderHistory);
        return true;
    }

    public boolean cancel(HttpServletRequest request, OrderDTO orderDTO){
        User userInfo = userService.getUserLogin(request);
        Order orderInfo = getOne(orderDTO.getId());
        if(userInfo.getId().equals(orderInfo.getIdSeller()) && orderInfo.getIdStatus() == 1){
            if(orderInfo.getIdType() == 2){
                Order orderSwapInfo = getByIdRedirect(orderInfo.getIdRedirect());
                Product productSwapInfo = productService.getOne(orderSwapInfo.getId());
                productSwapInfo.setIdStatus(6);
                productRepository.save(productSwapInfo);
                orderSwapInfo.setIdStatus(10);
                orderRepository.save(orderSwapInfo);
            }
            Product productInfo = productService.getOne(orderInfo.getIdProduct());
            productInfo.setIdStatus(6);
            productRepository.save(productInfo);
            orderInfo.setIdStatus(10);
            orderRepository.save(orderInfo);

            //Add Order history
            OrderHistory orderHistory = new OrderHistory();
            orderHistory.setIdOrder(orderInfo.getId());
            orderHistory.setIdUser(userInfo.getId());
            orderHistory.setIdStatus(orderInfo.getIdStatus());
            orderHistoryRepository.save(orderHistory);
        }
        return true;
    }
}