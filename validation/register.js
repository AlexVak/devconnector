const Validator = require("validator");
const isEmpty = require("./is-empy");

module.exports = function validateRegisterInput(data) {
  let errors = {};

  if (!Validator.isLength(data.name, { min: 3, max: 30 })) {
    errors.name = "Name must be between 3 and 30 characters";
  }

  return {
    errors,
    isValid: isEmpty(errors)
  };
};
