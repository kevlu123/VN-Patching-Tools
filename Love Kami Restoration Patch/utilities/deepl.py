# Copyright (C) 2023 Kevin Lu

import http.client
import json

cache_file = "tlcache.json"

class DeepLException(Exception):
    pass

try:
    with open(cache_file, encoding="utf-8") as f:
        tlcache = json.load(f)
except Exception:
    tlcache = {}

def pre_process(s):
    if s:
        s = s[0].upper() + s[1:]
    return s

def parse_response(data):
    data = json.loads(data)
    if "result" not in data:
        raise DeepLException
    collection = data["result"]["translations"][0]["beams"]
    collection = [x["sentences"][0]["text"] for x in collection]
    collection = [pre_process(x) for x in collection if x]
    return collection[0]

def get_from_cache(s):
    return tlcache.get(s, None)

def translate(s):
    try:
        if s in tlcache:
            return tlcache[s]

        conn = http.client.HTTPSConnection('www2.deepl.com')
        headers = {
            "Accept": "*/*",
            "Accept-Language": "en-US,en;q=0.5",
            "Content-type": "application/json",
            "Origin": "https://www.deepl.com",
            "DNT": "1",
            "Referer": "https://www.deepl.com/",
            "Sec-Fetch-Dest": "empty",
            "Sec-Fetch-Mode": "cors",
            "Sec-Fetch-Site": "same-site",
            "TE": "trailers",
        }
        content = "{\"jsonrpc\":\"2.0\",\"method\": \"LMT_handle_jobs\",\"params\":{\"jobs\":[{\"kind\":\"default\",\"sentences\":[{\"text\":\"INPUT TEXT\",\"id\":0,\"prefix\":\"\"}],\"raw_en_context_before\":[],\"raw_en_context_after\":[],\"preferred_num_beams\":4,\"quality\":\"fast\"}],\"lang\":{\"preference\":{\"weight\":{\"DE\":0.22299,\"EN\":2.26268,\"ES\":0.16948,\"FR\":1.0706,\"IT\":0.14076,\"JA\":0.07446,\"NL\":0.09867,\"PL\":0.07255,\"PT\":0.06725,\"RU\":0.03915,\"ZH\":0.06293,\"BG\":0.02456,\"CS\":0.05854,\"DA\":0.06409,\"EL\":0.01863,\"ET\":0.06018,\"FI\":0.08807,\"HU\":0.05134,\"LT\":0.04308,\"LV\":0.0374,\"RO\":0.04162,\"SK\":0.04958,\"SL\":0.04069,\"SV\":0.0622,\"TR\":0.03865,\"ID\":0.04184,\"UK\":0.03518},\"default\":\"default\"},\"source_lang_user_selected\":\"JA\",\"target_lang\":\"EN\"},\"priority\":-1,\"commonJobParams\":{\"mode\":\"translate\",\"browserType\":1,\"formality\":null},\"timestamp\":1671858913495},\"id\":56210010}"
        content = content.replace("INPUT TEXT", s).encode("utf-8")
        conn.request(
            'POST',
            '/jsonrpc?method=LMT_handle_jobs',
            headers=headers,
            body=content
            )
        response = conn.getresponse()
        data = response.read()
        data = data.decode("utf-8")
        tl = parse_response(data)
        if tl:
            tlcache[s] = tl
            with open(cache_file, "w", encoding="utf-8") as f:
                json.dump(tlcache, f, ensure_ascii=False, indent=0)
        return tl
    except DeepLException:
        print("DeepLException: " + data)
        raise
    except Exception:
        return None
