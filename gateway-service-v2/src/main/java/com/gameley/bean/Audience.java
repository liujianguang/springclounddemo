package com.gameley.bean;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * 秘钥信息注入
 *
 */
@ConfigurationProperties(prefix = "audience")
public class Audience {
    private String clientId;
    private String base64Secret;
    private String name;
    private int expiresSecond;
    private String client64Secret;

    public Audience() {
    }

    public String getClientId() {
        return clientId;
    }
    public void setClientId(String clientId) {
        this.clientId = clientId;
    }
    public String getBase64Secret() {
        return base64Secret;
    }
    public void setBase64Secret(String base64Secret) {
        this.base64Secret = base64Secret;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getExpiresSecond() {
        return expiresSecond;
    }
    public void setExpiresSecond(int expiresSecond) {
        this.expiresSecond = expiresSecond;
    }

    public String getClient64Secret() {
        return client64Secret;
    }

    public void setClient64Secret(String client64Secret) {
        this.client64Secret = client64Secret;
    }
}
