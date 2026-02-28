package com.example.BE_java_proj_Laptop_E_Commerce_web.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Order;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.OrderDetail;
import com.example.BE_java_proj_Laptop_E_Commerce_web.repository.OrderDetailRepository;
import com.example.BE_java_proj_Laptop_E_Commerce_web.repository.OrderRepository;

@Service
public class OrderService {

    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    // ===============================
    // 1. Lấy tất cả orders
    // ===============================
    public List<Order> fetchAllOrders() {
        return this.orderRepository.findAll();
    }

    // ===============================
    // 2. Lấy order theo id
    // ===============================
    public Optional<Order> fetchOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    // ===============================
    // 3. Xóa order
    // ===============================
    public void deleteOrderById(long id) {

        Optional<Order> orderOptional = this.fetchOrderById(id);

        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            // 1️ Xóa từng order detail trước
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for (OrderDetail orderDetail : orderDetails) {
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
            // 2️ Sau đó xóa order
            this.orderRepository.deleteById(id);
        }
    }

    // ===============================
    // 4. Update order
    // ===============================
    public void updateOrder(Order order) {

        Optional<Order> orderOptional = this.fetchOrderById(order.getId());

        if (orderOptional.isPresent()) {
            Order currentOrder = orderOptional.get();
            currentOrder.setStatus(order.getStatus());
            this.orderRepository.save(currentOrder);
        }
    }
}
