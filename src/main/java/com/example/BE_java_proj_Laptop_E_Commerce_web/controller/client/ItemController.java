package com.example.BE_java_proj_Laptop_E_Commerce_web.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Cart;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.CartDetail;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Product;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Product_;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.User;
import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.dto.ProductCriteriaDTO;
import com.example.BE_java_proj_Laptop_E_Commerce_web.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ItemController {

    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        long productId = id;
        String email = (String) session.getAttribute("email");

        this.productService.handleAddProductToCart(email, productId, session, 1);

        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        // Lấy session hiện tại (không tạo mới)
        HttpSession session = request.getSession(false);

        // Nếu chưa đăng nhập hoặc session không có id thì chuyển về login
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        // Lấy id user từ session
        long id = (long) session.getAttribute("id");

        // Tạo user hiện tại
        User currentUser = new User();
        currentUser.setId(id);

        // Lấy cart theo user
        Cart cart = this.productService.fetchByUser(currentUser);

        // Danh sách sản phẩm trong giỏ
        List<CartDetail> cartDetails =
                cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        // Tính tổng tiền
        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        // Đưa dữ liệu sang view
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        model.addAttribute("cart", cart);
        return "client/cart/show";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        this.productService.handleRemoveCartDetail(id, session);
        if (session != null) {
            session.setAttribute("toastHeading", "Giỏ hàng");
            session.setAttribute("toastText", "Đã xóa sản phẩm khỏi giỏ hàng");
            session.setAttribute("toastIcon", "warning");
        }
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String getCheckOutPage(Model model, HttpServletRequest request) {

        // 1️ Lấy session
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        // 2️ Lấy user id từ session
        long id = (long) session.getAttribute("id");

        User currentUser = new User();
        currentUser.setId(id);

        // 3️ Lấy cart theo user
        Cart cart = this.productService.fetchByUser(currentUser);

        // 4️ Lấy danh sách cartDetail
        List<CartDetail> cartDetails = (cart == null) ? new ArrayList<>() : cart.getCartDetails();

        // 5️ Tính tổng tiền
        double totalPrice = 0;

        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        // 6️ Đẩy dữ liệu ra view
        model.addAttribute("cart", cart);
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/checkout";
    }

    @PostMapping("/confirm-checkout")
    public String confirmCheckOut(@ModelAttribute("cart") Cart cart) {

        List<CartDetail> cartDetails = (cart == null) ? new ArrayList<>() : cart.getCartDetails();

        this.productService.handleUpdateCartBeforeCheckout(cartDetails);

        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        this.productService.handlePlaceOrder(currentUser, session, receiverName, receiverAddress,
                receiverPhone);

        return "redirect:/thanks";
    }

    @GetMapping("/thanks")
    public String getThankYouPage(Model model) {

        return "client/cart/thanks";
    }

    @PostMapping("/add-product-from-view-detail")
    public String handleAddProductFromViewDetail(@RequestParam("id") long id,
            @RequestParam("quantity") long quantity, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, id, session, quantity);

        return "redirect:/product/" + id;
    }

    @GetMapping("/products")
    public String getProductPage(Model model, ProductCriteriaDTO productCriteriaDTO,
            HttpServletRequest request) {
        int page = 1;
        try {
            if (productCriteriaDTO.getPage().isPresent()) {
                // convert from String to int
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
            } else {
                // page = 1
            }
        } catch (Exception e) {
            // page = 1
            // TODO: handle exception
        }


        // check sort price
        Pageable pageable = PageRequest.of(page - 1, 9);

        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();

            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, 9, Sort.by(Product_.PRICE).ascending());
            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, 9, Sort.by(Product_.PRICE).descending());
            } else {
                pageable = PageRequest.of(page - 1, 9);
            }
        } else {
            pageable = PageRequest.of(page - 1, 9);
        }


        Page<Product> prs = this.productService.fetchProductsWithSpec(pageable, productCriteriaDTO);

        List<Product> products =
                prs.getContent().size() > 0 ? prs.getContent() : new ArrayList<Product>();

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            // remove page
            qs = qs.replace("page=" + page, "");
        }

        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("queryString", qs);

        return "client/product/show";
    }


}
