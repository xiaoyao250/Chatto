/*
 The MIT License (MIT)

 Copyright (c) 2015-present Badoo Trading Limited.

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
*/

import Foundation

public protocol TextMessageViewModelProtocol: DecoratedMessageViewModelProtocol {
    var text: String { get }
}

public class TextMessageViewModel: TextMessageViewModelProtocol {
    public let text: String
    public let messageViewModel: MessageViewModelProtocol

    public init(text: String, messageViewModel: MessageViewModelProtocol) {
        self.text = text
        self.messageViewModel = messageViewModel
    }
}

public class TextMessageViewModelDefaultBuilder: ViewModelBuilderProtocol {
    public init() { }

    let messageViewModelBuilder = MessageViewModelDefaultBuilder()

    public func createViewModel(model: TextMessageModel) -> TextMessageViewModel {
        let messageViewModel = self.messageViewModelBuilder.createMessageViewModel(model)
        let textMessageViewModel = TextMessageViewModel(text: model.text, messageViewModel: messageViewModel)
        return textMessageViewModel

    }

    public func canCreateViewModel(fromModel model: Any) -> Bool {
        return model is TextMessageModel
    }
}
