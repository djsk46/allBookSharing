package com.allBookSharing.xxx.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.allBookSharing.xxx.dto.Hope;

@Component
public interface IHopeDao {

	List<Hope> lbHopeList(String id);

}