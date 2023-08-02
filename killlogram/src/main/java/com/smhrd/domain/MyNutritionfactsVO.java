package com.smhrd.domain;

public class MyNutritionfactsVO {
    private int mn_idx;
    private int nutri_idx;
    private String user_id;
    private String created_at;

    public MyNutritionfactsVO() {
    }

    public MyNutritionfactsVO(int mn_idx, int nutri_idx, String user_id, String created_at) {
        this.mn_idx = mn_idx;
        this.nutri_idx = nutri_idx;
        this.user_id = user_id;
        this.created_at = created_at;
    }

    public int getMn_idx() {
        return mn_idx;
    }

    public void setMn_idx(int mn_idx) {
        this.mn_idx = mn_idx;
    }

    public int getNutri_idx() {
        return nutri_idx;
    }

    public void setNutri_idx(int nutri_idx) {
        this.nutri_idx = nutri_idx;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }
}