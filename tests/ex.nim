import argon2_bind

const params = setupArgon2Params(
  timeCost = 3,
  memoryCostK = 1 shl 8,
  parallelism = 2,
  algoType = Argon2id,
)

const salt = "somesalt"
var pass = "password"

var res: Argon2Output
try:
  res = pass.getOutput(salt, params)
except Argon2Error:
  echo getCurrentExceptionMsg()
  quit 1

if res.encoded.isVerified(pass):
  echo res.hash
else:
  echo "failed verification..."
