"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.isSkintoneModifier = void 0;
/** Indicates whether a code point is a skintone modifier. */
const isSkintoneModifier = (code) => code >= 0x1f3fb && code <= 0x1f3ff;
exports.isSkintoneModifier = isSkintoneModifier;
//# sourceMappingURL=code-operations.js.map