package com.koreait.cobox.model.payment.repository;


import com.koreait.cobox.model.domain.ResSummary;

public interface ResSummaryDAO {
	public ResSummary selectById(int res_summary_id);
	public void insert(ResSummary resSummary);
	public void update(ResSummary resSummary);
	public void delete(ResSummary resSummary);
}
