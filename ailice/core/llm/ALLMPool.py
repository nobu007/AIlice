from ailice.core.llm.AModelChatGPT import AModelChatGPT
from ailice.core.llm.AModelLLAMA import AModelLLAMA
from ailice.core.llm.AModelYka import AModelYka


class ALLMPool:
    def __init__(self):
        self.pool = dict()
        return

    def ParseID(self, id):
        split = id.find(":")
        return id[:split], id[split + 1 :]

    def Init(self, llmIDs: [str]):
        for id in llmIDs:
            locType, location = self.ParseID(id)
            print("modelLocation=", location)
            if "oai" == locType:
                self.pool[id] = AModelChatGPT(location)
            elif "yka" == locType:
                self.pool[id] = AModelYka(location, modelLocation=location)
            else:
                self.pool[id] = AModelLLAMA(locType=locType, modelLocation=location)
        return

    def GetModel(self, modelID: str):
        return self.pool[modelID]


llmPool = ALLMPool()
