from abc import ABC, abstractmethod

# Interface for communication channels *(KeyBoard Input, Socket, GPIO, USBHID)
# Both input and output channels should implement this interface
class InputChannel(ABC):
    """Abstract base class for communication channels."""
    
    @abstractmethod
    async def send(self, message: str) -> None:
        pass

    @abstractmethod
    async def receive(self) -> str:
        pass