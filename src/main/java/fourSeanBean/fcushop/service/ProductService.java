package fourSeanBean.fcushop.service;

import fourSeanBean.fcushop.database.Sql2oDbHandler;
import fourSeanBean.fcushop.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sql2o.Connection;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    private Sql2oDbHandler sql2oDbHandler;

    public ProductService() {
    }

    public List<Product> getProducts() {
        Connection connection = sql2oDbHandler.getConnector().open();
        //language=sql
        String query = "SELECT * FROM PRODUCT";
        return connection.createQuery(query).executeAndFetch(Product.class);
    }

    public List<Product> searchProduct(String name) {
        Connection connection = sql2oDbHandler.getConnector().open();
        //language=sql
        String query = "SELECT * from PRODUCT WHERE NAME LIKE '%" + name + "%'";
        return connection.createQuery(query).executeAndFetch(Product.class);
    }
}
