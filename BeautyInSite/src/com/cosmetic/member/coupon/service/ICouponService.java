package com.cosmetic.member.coupon.service;

import java.util.List;
import java.util.Map;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.coupon.vo.CouponVO;

public interface ICouponService {

	List<CouponVO> getCouponList(int accNo);

	List<AccountVO> couponManage();

	int couponInsert(Map<String, Object> map);

	int couponUse(Map<String, Object> map);


}
