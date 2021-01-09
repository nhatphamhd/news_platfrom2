package com.example.controller.amin;

import com.example.constant.SystemConstant;
import com.example.dto.NewDTO;
import com.example.service.INewService;
import com.example.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller(value = "newControllerOfAdmin")
public class NewController {
    @Autowired
    private INewService newService;
    @RequestMapping(value = "/admin/new/list",method = RequestMethod.GET)
    public ModelAndView getUsers(@ModelAttribute(SystemConstant.MODEL) NewDTO model,
                                 HttpServletRequest request){
        ModelAndView mvn = new ModelAndView("admin/new/list");
        DisplayTagUtils.initSearchBean(request,model);
        Pageable pageable=new PageRequest(model.getPage() -1,model.getMaxPageItems());
        List<NewDTO> news=newService.getNews(pageable);
        model.setListResult(news);
        model.setTotalItems(newService.getTotlalItems());
        mvn.addObject(SystemConstant.MODEL,model);
        return  mvn;
    }
}
