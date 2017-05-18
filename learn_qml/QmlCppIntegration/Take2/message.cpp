#include "message.h"

Message::Message()
{
    m_body = new MessageBody(); // for simplicity, using plain old raw pointer type
}

Message::~Message()
{
    delete m_body;
}
