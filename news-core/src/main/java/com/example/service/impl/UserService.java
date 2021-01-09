package com.example.service.impl;

import com.example.dto.UserDTO;
import com.example.entity.UserEntity;
import com.example.repository.UserRepository;
import com.example.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService implements IUserService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public List<UserDTO> getALL() {
        List<UserDTO> userDTOS=new ArrayList<>();
        List<UserEntity> userEntities=userRepository.findAll();
        for (UserEntity item:userEntities){
            UserDTO userDTO=new UserDTO();
            userDTO.setFullName(item.getFullName());
            userDTO.setUserName(item.getUserName());
            userDTO.setStatus(item.getStatus());
            userDTOS.add(userDTO);

        }
        return userDTOS;
    }
}
