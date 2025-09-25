import fs from 'fs'

/**
 * @param {string} filePath
 * @param {string} s
 * @param {string} part
 */
export default (filePath, s, part) => {
    const data = fs.readFileSync(filePath, 'utf8')
    const lines = data.split('\n')
    const h = `[${part}]`

    // Найти начало секции
    const startIndex = lines.findIndex(line => line.startsWith(h))
    if (startIndex === -1) {
        throw new Error(`Section [${part}] not found in file`)
    }

    // Найти конец секции или конец файла
    let endIndex = startIndex + 1
    while (endIndex < lines.length && !lines[endIndex].startsWith('[')) {
        endIndex++
    }

    // Добавить строку в конец секции и пустую строку после неё
    lines.splice(endIndex, 0, s, '')

    // Записать обновлённые данные обратно в файл
    fs.writeFileSync(filePath, lines.join('\n'))
}