package com.example.service;
import com.example.dto.NewDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface INewService {
    List<NewDTO> getAll();
    List<NewDTO> getNews(Pageable pageable);
    int getTotlalItems();
}
