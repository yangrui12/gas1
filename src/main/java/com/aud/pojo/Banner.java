package com.aud.pojo;

public class Banner {
    private Integer id;

    private String name;

    private String url;

    private String imgUrl;
    
    private String lang;

    public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public Integer getId() {
        return id;
    }

    @Override
		public String toString() {
			return "Banner [id=" + id + ", name=" + name + ", url=" + url + ", imgUrl=" + imgUrl + "]";
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl == null ? null : imgUrl.trim();
    }
}