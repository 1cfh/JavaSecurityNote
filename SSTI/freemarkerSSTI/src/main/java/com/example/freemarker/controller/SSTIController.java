package com.example.freemarker.controller;
import freemarker.template.utility.Execute;
import jakarta.servlet.ServletContext;
import org.springframework.boot.actuate.autoconfigure.wavefront.WavefrontProperties;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.WebApplicationContext;


import java.util.HashMap;
import java.util.Map;


@Controller
public class SSTIController {


    @RequestMapping({"/", "/index"})
    public String index(ModelMap modelmap, @RequestParam(defaultValue = "1cfh") String username, @RequestParam(defaultValue = "Java SSTI") String msg) {
        Map<String, String> map = new HashMap<>();
        map.put("username", username);
        map.put("msg", msg);
        modelmap.addAttribute("user", map);
        return "index";
    }


    @GetMapping({"/test"})
    public String test(){
        return "test";
    }

}

// POC1:
