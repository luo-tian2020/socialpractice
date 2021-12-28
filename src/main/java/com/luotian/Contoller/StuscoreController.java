/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/18  12:49
 * Content:
 **/

package com.luotian.Contoller;

import com.luotian.Service.StuscoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;
@Controller
public class StuscoreController {
    @Autowired
    private StuscoreService stuscoreService;

    @RequestMapping("/searchscore")
    public ModelAndView searchScore(String id)
    {
        ModelAndView modelAndView=new ModelAndView();
        List<Map<String,Object>> studentScore= stuscoreService.findScoreStudent(id);
        modelAndView.setViewName("studentscore");
        modelAndView.addObject("studentScore",studentScore);
        return modelAndView;
    }
}
