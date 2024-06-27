/**
 * @param {import('jass-to-ast').Native} native
 * @return {string}
 */
export default native => {
    const param = []
    if (native.params) for (const p of native.params) {
        param.push(`${p.type} ${p.name}`)
    }

    return `${native.returns ?? 'nothing'} ${native.name} (${param.join(', ')})`
}
