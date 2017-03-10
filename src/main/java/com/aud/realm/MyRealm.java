package com.aud.realm;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.aud.pojo.User;
import com.aud.service.IUserService;

public class MyRealm extends AuthorizingRealm{

	@Resource
	private IUserService userService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String userName=(String)principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo authorizationInfo=new SimpleAuthorizationInfo();
        authorizationInfo.setRoles(userService.getRoles(userName));
		//authorizationInfo.setStringPermissions(userService.getPermissions(userName));
		return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String userName=(String)token.getPrincipal();
			List<User> users=userService.getByUserName(userName);
			if(users!=null){
				User user = users.get(0);
				AuthenticationInfo authcInfo=new SimpleAuthenticationInfo(user.getName(),user.getPassword(),"xx");
				return authcInfo;
			}else{
				return null;
			}
	}

}