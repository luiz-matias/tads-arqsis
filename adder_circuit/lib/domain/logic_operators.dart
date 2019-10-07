class LogicOperators {
  static bool and(bool bit1, bool bit2) {
    return bit1 && bit2;
  }

  static bool or(bool bit1, bool bit2) {
    return bit1 || bit2;
  }

  static bool xor(bool bit1, bool bit2) {
    return bit1 != bit2;
  }

  static bool not(bool bit) {
    return !bit;
  }

  static bool nand(bool bit1, bool bit2) {
    return !(and(bit1, bit2));
  }

  static bool nor(bool bit1, bool bit2) {
    return !(or(bit1, bit2));
  }
}
