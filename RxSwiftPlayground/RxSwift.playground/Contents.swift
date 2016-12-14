//: Please build the scheme 'RxSwiftPlayground' first
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

import RxSwift

//exampleOf(description: "just") {
//    let observable = Observable.just("Hello, World")
//    
//    observable.subscribe
//        { event in print(event)
//    }
//}
//
//exampleOf(description: "of" ){
//    let observable = Observable.of(1,2,3)
//    
//    observable.subscribe{
//        print($0)
//    }
//}
//
//exampleOf(description: "toObservable")
//{
//    Observable.from([1,2,3]).subscribe(onNext:
//        { print($0)
//        } , onCompleted: { print("Completed")} ).addDisposableTo(DisposeBag())
//}
//
//exampleOf(description: "error")
//{
//    enum TestError:Error
//    {
//        case test
//    }
//    let disposeBag = DisposeBag()
//    
//    Observable<Int>.error(TestError.test)
//        .subscribe { print($0) }
//        .addDisposableTo(disposeBag)
//    
//}
////Second Video
//exampleOf(description: "PublishSubject"){
//    
//    let subject = PublishSubject<String>()
//    subject.subscribe{ print($0) }
//    
//    enum TestError:Error
//    {
//        case test
//    }
//    
//    subject.onNext("Hello")
//   // subject.onError(TestError.test)
//    //subject.onCompleted()
//    subject.onNext("World!")
//    
//    let newSubscription =  subject.subscribe(onNext: {
//        print("New Subsription: " + $0)
//    })
//    subject.onNext("What's Up")
//    newSubscription.dispose()
//    subject.onNext("Still there?")
//}
//
//exampleOf(description: "BehaviorSubject"){
//    let subject = BehaviorSubject(value: "a")
//    
//    let firstSUbscription =  subject.subscribe(onNext: {
//        print(#line, $0)
//    })
//    
//    subject.onNext("b")
//    
//    let secondSubscription = subject.subscribe(onNext:{
//        print(#line, $0)
//    })
//}
//
//exampleOf(description: "ReplaySUbject"){
//    let subject =  ReplaySubject<Int>.create(bufferSize: 3)
//    
//    subject.onNext(1)
//    subject.onNext(2)
//    subject.onNext(3)
//    subject.onNext(4)
//    
//    subject.subscribe(onNext:{
//        print($0)
//    })
//}
//exampleOf(description: "Variable"){
//    let disposeBag =  DisposeBag()
//    let variable =  Variable("A")
//    
//    variable.asObservable().subscribe(onNext:{
//        print($0)
//    }).addDisposableTo(disposeBag)
//    
//    variable.value = "B"
//    variable.value = "C"
//    
//}
//
////Third Video 
//
//exampleOf(description: "Map")
//{
//    Observable.of(1,2,3).map{ $0 * $0 }.subscribe(onNext:
//        {
//            print($0)
//    }).dispose()
//}
//exampleOf(description: "FlatMap & FlatMapLatest")
//{
//  let disposBag = DisposeBag()
//    struct Player
//    {
//        let score:Variable<Int>
//    }
//    //flatmap me enseña los cambios hechos a scott y yeis
//    //mientras que flatmaplatest regresa solamente los cambios hechos a yeis
//    let scott = Player(score:Variable(80))
//    let yeis = Player(score:Variable(70))
//    var player  = Variable(scott)
//    player.asObservable().flatMap
//        {
//            $0.score.asObservable()
//        }.subscribe(onNext: { print($0)}).addDisposableTo(disposBag)
//    player.value.score.value = 85
//    scott.score.value = 88
//    
//    player.value  = yeis
//    scott.score.value = 90
//}
//
//exampleOf(description: "Scan")
//{
//    let disposebag = DisposeBag()
//    let dartScore = PublishSubject<Int>()
//    
//    dartScore.asObservable()
//        .buffer(timeSpan: 0.0, count: 3, scheduler: MainScheduler.instance)
//        .map{ $0.reduce(0 , + )}
//        .scan(501)
//        {
//            intermediate , newValue in
//            let result =  intermediate -  newValue
//            return result >= 0 || result > 1  ? result:intermediate
//        }.do(onNext:{
//            if $0 == 0
//            {
//                dartScore.onCompleted()
//            }
//        }).subscribe{
//            print($0.isStopEvent  ? $0: $0.element!)
//        }
//        .addDisposableTo(disposebag)
//    
//    
//    dartScore.onNext(13)
//    dartScore.onNext(50)
//    dartScore.onNext(60)
//    dartScore.onNext(0)
//    dartScore.onNext(0)
//    dartScore.onNext(378)
//
//
//}
//
//exampleOf(description: "filter")
//{
//    let disposeBag = DisposeBag()
//    let numbers = Observable.generate(initialState: 1, condition: { $0  < 101 }, iterate: { $0 + 1 })
//    
//    numbers.filter
//        {number in
//            guard number > 1 else {return false }
//            var isPrime = true
//            
//            (2..<number).forEach
//                {
//                    if number % $0 == 0{
//                        isPrime =  false
//                    }
//            }
//            return isPrime
//    }.toArray()
//        .subscribe(onNext:
//            {
//                print($0)
//        })
//}

//exampleOf(description: "distinctUntilChanged" )
//{
//    let disposeBag  =  DisposeBag()
//    let searchString =  Variable("")
//    
//    searchString.asObservable()
//        .map{ $0.lowercased()}
//        .distinctUntilChanged()
//        .subscribe(onNext: { print($0)})
//        .addDisposableTo(disposeBag)
//    
//    searchString.value = "Apple"
//    searchString.value = "APPLE"
//    searchString.value = "BANana"
//    searchString.value = "Apple"
//}
exampleOf(description: "takeWhile")
{
    print("Wolo")
    let disposeBag =  DisposeBag()
    let numbers = Observable.of(1,2,3,4,3,2,1)
    
    numbers.takeWhile{ $0 < 4 }.subscribe(onNext:
        {
             print($0)
    })
    .addDisposableTo(disposeBag)
}


exampleOf(description: "startWith")
{
    let disposeBag = DisposeBag()
    Observable.of("1","2","3")
        .startWith("A")
        .startWith("B")
        .startWith("C","B")
        .subscribe(onNext:{ print($0) })
        .addDisposableTo(disposeBag)

}
exampleOf(description: "")
{
    let dispose = DisposeBag()
    
    let subject1 = PublishSubject<String>()
    let subject2 =  PublishSubject<String>()
    
    Observable.of(subject1, subject2).merge()
        .subscribe(onNext: { print($0) })
    
    subject1.onNext("W")
    subject1.onNext("P")
    subject2.onNext("A")
    subject2.onNext("B")
    subject1.onNext("O")
    subject2.onNext("L")
}

exampleOf(description: "zip"){
    let disposeBag = DisposeBag()
    
    let stringSubject = PublishSubject<String>()
    let intSubject = PublishSubject<Int>()
    
    Observable.zip(stringSubject  , intSubject){
        stringElement , intElement in "\(stringElement) \(intElement)"
        }.subscribe(onNext:{
            print($0)
        })
    stringSubject.onNext("A")
    stringSubject.onNext("B")
    
    intSubject.onNext(1)
    intSubject.onNext(2)
}

