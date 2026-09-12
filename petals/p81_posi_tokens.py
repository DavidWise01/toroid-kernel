"""Petals P81: bounded token language for the Posi thought trace."""

VOCABULARY={"observe","align","learn","hold"}

def interpret(text:str)->dict:
    tokens=tuple(text.lower().split())
    if not tokens or any(token not in VOCABULARY for token in tokens):
        return {"tokens":tokens,"accepted":False,"trace":("observe","halt-unknown-token")}
    return {"tokens":tokens,"accepted":True,"trace":("observe","compare","decide","learn")}

def main()->None:
    good=interpret("observe align learn")
    assert good["accepted"] and good["tokens"]==("observe","align","learn")
    assert good["trace"]==("observe","compare","decide","learn")
    bad=interpret("observe execute")
    assert not bad["accepted"] and bad["trace"]==("observe","halt-unknown-token")
    assert not interpret("")["accepted"]
    print("P81 PASS: bounded Posi vocabulary accepts known tokens and halts unknown input")

if __name__=="__main__": main()
