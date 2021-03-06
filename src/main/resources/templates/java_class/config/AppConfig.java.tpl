package ${packageName}.config;

import org.mayanjun.util.KeyPairStore;
import org.mayanjun.util.SecretKeyStore;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 系统配置。接受YAML文件中的配置
 * @since ${date}
 * @author ${author}
 * @vendor ${vendor}
 * @generator ${generatorVersion}
 * @manufacturer ${manufacturer}
 */
@Component
@ConfigurationProperties(prefix = "app-config")
public class AppConfig implements InitializingBean {

    private String env;

    private String domain;

    private String privateKey;

    private String publicKey;

    private KeyPairStore keyPairStore;

    private SecretKeyStore secretKeyStore;

    private String tokenCookieName;

    private String uploadDir;

    private String systemName;

    private String aesSecretKey;

    private String aesIv;

    public String getEnv() {
        return env;
    }

    /**
     * @param env The unique spring active profile
     */
    public void setEnv(String env) {
        this.env = env;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        this.keyPairStore = new KeyPairStore(this.privateKey, this.publicKey);
        secretKeyStore = new SecretKeyStore(aesSecretKey, aesIv);
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getPrivateKey() {
        return privateKey;
    }

    public void setPrivateKey(String privateKey) {
        this.privateKey = privateKey;
    }

    public String getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(String publicKey) {
        this.publicKey = publicKey;
    }

    public KeyPairStore keyPairStore() {
        return keyPairStore;
    }

    public SecretKeyStore secretKeyStore() {
        return secretKeyStore;
    }

    public String getTokenCookieName() {
        return tokenCookieName;
    }

    public void setTokenCookieName(String tokenCookieName) {
        this.tokenCookieName = tokenCookieName;
    }

    public String getUploadDir() {
        return uploadDir;
    }

    public void setUploadDir(String uploadDir) {
        this.uploadDir = uploadDir;
    }

    public String getSystemName() {
        return systemName;
    }

    public void setSystemName(String systemName) {
        this.systemName = systemName;
    }

    public String getAesSecretKey() {
        return aesSecretKey;
    }

    public void setAesSecretKey(String aesSecretKey) {
        this.aesSecretKey = aesSecretKey;
    }

    public String getAesIv() {
        return aesIv;
    }

    public void setAesIv(String aesIv) {
        this.aesIv = aesIv;
    }
}
