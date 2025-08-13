/**
 * @param  {string} str
 * @return {string}
 */
export default (str = '') => {
    str = String(str)
    if (str.length === 0) return ''
    return str.charAt(0).toUpperCase() + str.slice(1)
}
