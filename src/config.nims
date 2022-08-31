if existsEnv("NIX_CRYPTO_PATH"):
  --dynlibOverride:crypto
  --passL:"$NIX_CRYPTO_PATH"