package com.example.BE_java_proj_Laptop_E_Commerce_web.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.BE_java_proj_Laptop_E_Commerce_web.domain.Product;
import com.example.BE_java_proj_Laptop_E_Commerce_web.service.ProductService;
import com.example.BE_java_proj_Laptop_E_Commerce_web.service.UploadService;

import jakarta.validation.Valid;

@Controller
public class ProductController {

    private final UploadService uploadService;
    private final ProductService productService;

    public ProductController(UploadService uploadService, ProductService productService) {
        this.uploadService = uploadService;
        this.productService = productService;
    }

    // ===================== LIST =====================
    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        List<Product> products = this.productService.fetchProducts();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    // ===================== DETAIL =====================
    @GetMapping("/admin/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }

    // ===================== CREATE =====================
    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String handleCreateProduct(Model model, @ModelAttribute("newProduct") @Valid Product pr,
            BindingResult newProductBindingResult, @RequestParam("hungFile") MultipartFile file) {

        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create";
        }

        // upload image
        String image = this.uploadService.handleSaveUploadFile(file, "product");
        pr.setImage(image);

        this.productService.createProduct(pr);
        return "redirect:/admin/product";
    }

    // ===================== UPDATE =====================
    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product currentProduct = this.productService.getProductById(id);
        model.addAttribute("newProduct", currentProduct);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(Model model, @ModelAttribute("newProduct") @Valid Product pr,
            BindingResult newUserBindingResult, @RequestParam("hungFile") MultipartFile file) {

        // validate
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        // validate
        if (newUserBindingResult.hasErrors()) {
            return "admin/product/update";
        }
        //

        Product currentProduct = this.productService.getProductById(pr.getId());
        if (currentProduct != null) {
            // update info
            currentProduct.setName(pr.getName());
            currentProduct.setPrice(pr.getPrice());
            currentProduct.setQuantity(pr.getQuantity());
            currentProduct.setSold(pr.getSold());
            currentProduct.setFactory(pr.getFactory());
            currentProduct.setTarget(pr.getTarget());
            currentProduct.setShortDesc(pr.getShortDesc());
            currentProduct.setDetailDesc(pr.getDetailDesc());


            // CHỈ update image nếu có upload mới
            if (file != null && !file.isEmpty()) {
                // xoá ảnh cũ
                this.uploadService.handleDeleteUploadFile(currentProduct.getImage(), "product");

                // lưu ảnh mới
                String newImage = this.uploadService.handleSaveUploadFile(file, "product");
                currentProduct.setImage(newImage);
            }

            this.productService.createProduct(currentProduct);
        }

        return "redirect:/admin/product";
    }

    // ===================== DELETE =====================
    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("newProduct") Product pr) {

        Product currentProduct = this.productService.getProductById(pr.getId());

        if (currentProduct != null) {

            // xoá ảnh
            this.uploadService.handleDeleteUploadFile(currentProduct.getImage(), "product");

            // xoá product
            this.productService.deleteProduct(pr.getId());
        }

        return "redirect:/admin/product";
    }
}
