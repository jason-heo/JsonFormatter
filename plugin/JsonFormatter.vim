function! FormatJson()
python <<endPython
import json
import vim

try:
    formatted_json = json.dumps(json.loads('\n'.join(vim.current.buffer[:])),
                                indent=2,
                                ensure_ascii=False).encode('utf8')

    vim.current.buffer[:] = None # buffer 내용 삭제

    for line in str.split(formatted_json, '\n'):
        vim.current.buffer.append(str(line))

    vim.current.buffer[0] = None # 첫 줄에 빈 문자열이 저장되서 삭제

except ValueError, e:
    print e

endPython
endfunction

command! FormatJson call FormatJson()
