require 'openssl'
require 'digest'

class Crypto
  def encrypt(data, key)
    cipher = OpenSSL::Cipher::Cipher.new("aes-256-cbc")
    cipher.encrypt
    cipher.key = key = Digest::SHA256.digest(key)
    random_iv = cipher.random_iv
    cipher.iv = Digest::SHA256.digest(random_iv + key)[0..15]
    encrypted = cipher.update(data)
    encrypted << cipher.final
    return random_iv + encrypted
  end

  def decrypt(data, key)
    cipher = OpenSSL::Cipher::Cipher.new("aes-256-cbc")
    cipher.decrypt
    cipher.key = cipher_key = Digest::SHA256.digest(key)
    random_iv = data[0..15] # extract iv from first 16 bytes
    data = data[16..data.size-1]
    cipher.iv = Digest::SHA256.digest(random_iv + cipher_key)[0..15]
    begin
      decrypted = cipher.update(data)
      decrypted << cipher.final
    rescue OpenSSL::CipherError, TypeError
      return nil
    end

    return decrypted
  end
end