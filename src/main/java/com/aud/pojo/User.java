package com.aud.pojo;

public class User {
    private Integer id;

    private String name;

    private String password;

    private Integer roleId;

    private Role  roles;
	



	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", roleId=" + roleId + ", roles="
				+ roles + "]";
	}

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

   
	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer role_id) {
		this.roleId = role_id;
	}

	public Role getRoles() {
		return roles;
	}

	public void setRoles(Role roles) {
		this.roles = roles;
	}


}