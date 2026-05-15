package com.nrmpattusaries.dao;

import java.util.List;
import com.nrmpattusaries.model.Saree;

public interface SareeDAO {

    boolean addSaree(Saree saree);

    List<Saree> getAllSarees();
    
    List<Saree> getSareesByCategory(int categoryId);
    
    List<Saree> searchSarees(String keyword, Integer categoryId);

    Saree getSareeById(int sareeId);

    boolean updateSaree(Saree saree);

    boolean deleteSaree(int sareeId);
    
    List<Saree> getLowStockSarees();
}