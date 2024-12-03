package com.Entity;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class SimpleEncryption {

	private static final String SECRET_KEY = "8963254125789654";

	public static String encrypt(String data) throws Exception {
		Cipher cipher = Cipher.getInstance("AES");
		SecretKeySpec keySpec = new SecretKeySpec(SECRET_KEY.getBytes(), "AES");
		cipher.init(Cipher.ENCRYPT_MODE, keySpec);
		byte[] encryptedBytes = cipher.doFinal(data.getBytes());
		return Base64.getEncoder().encodeToString(encryptedBytes);
	}

	public static String decrypt(String encryptedData) throws Exception {
		Cipher cipher = Cipher.getInstance("AES");
		SecretKeySpec keySpec = new SecretKeySpec(SECRET_KEY.getBytes(), "AES");
		cipher.init(Cipher.DECRYPT_MODE, keySpec);
		byte[] decryptedBytes = cipher.doFinal(Base64.getDecoder().decode(encryptedData));
		return new String(decryptedBytes);
	}

}