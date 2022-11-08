class Queue:
    def __init__(self):
        self.queue = []
        self.unique_set = set()

    def add(self, element):
        if not self.contain(element):
            self.queue.append(element)
            self.unique_set.add(element)

    def pop(self):
        val = None
        if len(self.queue) > 1:
            val = self.queue.pop(0)
            self.unique_set.remove(val)
        return val

    def contain(self, element):
        if element in self.unique_set:
            return True
        else:
            return False
