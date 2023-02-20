package com.market.online.config.scheduler;

import com.market.online.entity.Order;
import com.market.online.entity.OrderHistory;
import com.market.online.entity.Product;
import com.market.online.repository.OrderHistoryRepository;
import com.market.online.repository.OrderRepository;
import com.market.online.repository.ProductRepository;
import com.market.online.user.service.OrderService;
import com.market.online.user.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import java.util.Calendar;
import java.util.List;

@Configuration
@EnableScheduling
public class SchedulerConfig {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderService orderService;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderHistoryRepository orderHistoryRepository;

    @Scheduled(fixedDelay = 300000, initialDelay = 300000) //300000
    public void updateAutoCancelOrder(){
        Calendar cl = Calendar.getInstance();
        cl.add(Calendar.MINUTE, -30);

        List<Order> orders = orderRepository.findListCancel(cl.getTime());
        if(orders.size() > 0){
            orders.forEach((el) -> {
                cancelOrder(el.getId());
            });
        }
    }

    private void cancelOrder(Integer idOrder){
        Order orderInfo = orderService.getOne(idOrder);
        if(orderInfo.getIdType() == 2){
            Order orderSwapInfo = orderService.getByIdRedirect(orderInfo.getIdRedirect());
            Product productSwapInfo = productService.getOne(orderSwapInfo.getIdProduct());
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
        orderHistory.setIdUser(1);
        orderHistory.setIdStatus(orderInfo.getIdStatus());
        orderHistoryRepository.save(orderHistory);
    }
}
