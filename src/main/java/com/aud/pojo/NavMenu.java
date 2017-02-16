package com.aud.pojo;

public class NavMenu {
    private Integer id;

    private String name;

    private String lang;

    private Integer parentNav;

    private String navMenuDesc;

    private String content;

    private String imgUrl;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getLang() {
        return lang;
    }

    public void setLang(String lang) {
        this.lang = lang == null ? null : lang.trim();
    }

    public Integer getParentNav() {
        return parentNav;
    }

    public void setParentNav(Integer parentNav) {
        this.parentNav = parentNav;
    }

    public String getNavMenuDesc() {
        return navMenuDesc;
    }

    public void setNavMenuDesc(String navMenuDesc) {
        this.navMenuDesc = navMenuDesc == null ? null : navMenuDesc.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl == null ? null : imgUrl.trim();
    }
}