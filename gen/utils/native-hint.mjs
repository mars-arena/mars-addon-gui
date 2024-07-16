import nativeIsVanilla from './native-is-vanilla.mjs'
import nativeDeclaration from './native-declaration.mjs'

/**
 * @param {import('jass-to-ast').Native} native
 * @return {string}
 */
export default native => `[${nativeIsVanilla(native) ? 'NATIVE' : 'UjAPI'}] ${nativeDeclaration(native)}`
