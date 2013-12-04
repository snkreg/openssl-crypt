openssl-crypt
=============

openssl-crypt is a script that makes securely encrypting and decrypting files easy. It can used for all files of any file format, and is useful for securing confidential information stored on physical storage devices and servers. It is also useful for sending files securely over internet communication mediums like email and IM. The encryption and decryption process deals with the binary of the file, so a decrypted version of the file will always be exactly like the original copy. For added security, you can encrypt a already encrypted file so multiple passwords are needed to successfully decrypt the file. The script automatically adds a ".x" file extension to the file's full name every time it is encrypted file so it's easy to tell what is and isn't encrypted, and how many times ia given file has been encrypted.

Execution
=========

On Unix Systems that support Bash, use the following Terminal command to start openssl-crypt.

```
bash openssl-crypt.sh
```

(A Windows Batch script is currently under development.)