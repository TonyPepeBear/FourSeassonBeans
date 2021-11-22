package fourSeanBean.fcushop.controller;

import fourSeanBean.fcushop.model.Product;
import fourSeanBean.fcushop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class SearchController {

    @Autowired
    ProductService productManager;

    @GetMapping("/search/{name}")
    public List<Product> searchProduct(@PathVariable String name){
        return productManager.searchProduct(name);
    }
}
