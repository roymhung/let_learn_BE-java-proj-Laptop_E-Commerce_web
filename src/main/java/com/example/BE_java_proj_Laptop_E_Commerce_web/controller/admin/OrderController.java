package com.example.BE_java_proj_Laptop_E_Commerce_web.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Order;
import com.example.BE_java_proj_Laptop_E_Commerce_web.service.OrderService;


@Controller
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    // ===============================
    // 1. Danh sách order
    // ===============================
    @GetMapping("/admin/order")
    public String getDashboard(Model model) {
        List<Order> orders = this.orderService.fetchAllOrders();
        model.addAttribute("orders", orders);
        return "admin/order/show";
    }

    // ===============================
    // 2. Chi tiết order
    // ===============================
    @GetMapping("/admin/order/{id}")
    public String getOrderDetailPage(Model model, @PathVariable long id) {

        Optional<Order> orderOptional = this.orderService.fetchOrderById(id);

        if (orderOptional.isEmpty()) {
            return "redirect:/admin/order";
        }

        Order order = orderOptional.get();

        model.addAttribute("order", order);
        model.addAttribute("orderDetails", order.getOrderDetails());

        return "admin/order/detail";
    }

    // ===============================
    // 3. Trang xác nhận xóa
    // ===============================
    @GetMapping("/admin/order/delete/{id}")
    public String getDeleteOrderPage(Model model, @PathVariable long id) {

        model.addAttribute("id", id);
        model.addAttribute("newOrder", new Order());

        return "admin/order/delete";
    }

    // ===============================
    // 4. Xóa order
    // ===============================
    @PostMapping("/admin/order/delete")
    public String postDeleteOrder(@ModelAttribute("newOrder") Order order) {

        this.orderService.deleteOrderById(order.getId());

        return "redirect:/admin/order";
    }

    // ===============================
    // 5. Trang update
    // ===============================
    @GetMapping("/admin/order/update/{id}")
    public String getUpdateOrderPage(Model model, @PathVariable long id) {

        Optional<Order> currentOrder = this.orderService.fetchOrderById(id);

        if (currentOrder.isEmpty()) {
            return "redirect:/admin/order";
        }

        model.addAttribute("newOrder", currentOrder.get());

        return "admin/order/update";
    }

    // ===============================
    // 6. Update order
    // ===============================
    @PostMapping("/admin/order/update")
    public String handleUpdateOrder(@ModelAttribute("newOrder") Order order) {

        this.orderService.updateOrder(order);

        return "redirect:/admin/order";
    }
}
