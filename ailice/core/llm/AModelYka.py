import os
import sys

import torch
import transformers
from ailice.common.AConfig import config
from ailice.common.utils.ATextSpliter import sentences_split
from ailice.core.llm.AFormatter import (
    AFormatterAMAZON,
    AFormatterChatML,
    AFormatterGPT,
    AFormatterLLAMA2,
    AFormatterOpenChat,
    AFormatterSimple,
    AFormatterVicuna,
    AFormatterYka,
    AFormatterZephyr,
)
from peft import PeftConfig, PeftModel
from termcolor import colored

# commonモジュールをインポートする
COMMON_MOD_DIR = os.path.abspath(
    os.path.join(os.path.dirname(__file__), "../../../../../common")
)
print("COMMON_MOD_DIR=", COMMON_MOD_DIR)
sys.path.append(COMMON_MOD_DIR)


from yka_langchain import yka_langchain_raw


class AModelYka:
    def __init__(self, locType: str, modelLocation: str):
        self.locType = locType
        self.tokenizer = transformers.AutoTokenizer.from_pretrained(
            modelLocation,
            use_fast=False,
            legacy=False,
            force_download=False,
            resume_download=True,
        )
        self.model = None
        self.formatter = AFormatterYka(tokenizer=self.tokenizer, systemAsUser=False)
        # self.formatter = AFormatterSimple(tokenizer=self.tokenizer, systemAsUser=False)
        self.contextWindow = 8192

    def Generate(
        self,
        prompt: list[dict[str, str]],
        proc: callable,
        endchecker: callable,
        temperature: float = 0.2,
    ) -> str:
        # print("prompt=", prompt)
        # prompt = [{"role": "user", "content": "hellow"},...]
        proc(txt="", action="open")
        messages = prompt
        text = yka_langchain_raw(messages, is_chat=True)
        proc(txt=text, action="close")
        return text
