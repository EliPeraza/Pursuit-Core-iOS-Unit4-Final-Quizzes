//
//  SearchController.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit


class SearchController: UIViewController {
  
  
  let searchView = SearchView()
  
  
  var factsFromInternet = [Quiz]() {
    didSet{
      DispatchQueue.main.async {
        self.searchView.searchCollectionView.reloadData()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    navigationItem.title = "Search Quizzes Online"
    
    view.addSubview(searchView)
    searchView.searchCollectionView.register(SearchCollectionCell.self, forCellWithReuseIdentifier: "SearchCollectionCell")
    
    searchView.searchCollectionView.dataSource = self
    searchView.searchCollectionView.delegate = self
    
    getFacts()
  }
  
  func getFacts() {
    QuizAPIClient.getQuizData { (appError, factsData) in
      if let appError = appError {
        print(appError.errorMessage())
      }
      if let data = factsData {
        self.factsFromInternet = data
      }
    }
  }
  
}

extension SearchController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return factsFromInternet.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = searchView.searchCollectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionCell", for: indexPath) as? SearchCollectionCell else {return UICollectionViewCell()}
    cell.backgroundColor = .white
    cell.layer.borderWidth = 1.0
    cell.layer.borderColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
    cell.layer.cornerRadius = 15.0
    
    cell.delegate = self
    
    let quiz = factsFromInternet[indexPath.row]
    
    cell.configureCell(storedQuiz: quiz)
    
    
    
    return cell
    
  }
  
  
  @objc func saveButtonHasBeenPressed(_ sender: UIButton) {
    
    
    let addedQuizAlert = UIAlertController.init(title: "Quiz was saved", message: nil, preferredStyle: .alert)
    let ok = UIAlertAction.init(title: "Ok", style: .default) { (okPressed) in
      self.dismiss(animated: true, completion: nil)
    }
    
    addedQuizAlert.addAction(ok)
    present(addedQuizAlert, animated: true, completion: nil)
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: searchView.searchCollectionView.bounds.width - 30, height: (searchView.searchCollectionView.bounds.height) / 2)
  }
}

extension SearchController: SearchCollectionCellDelegate {
  func saveButton(_ searchCollectonCell: SearchCollectionCell, storedQuiz: Quiz) {
    let uuID = UUID().uuidString
    
    let myQuiz = UserStoredQuizzesModel.init(createdAt: Date.getISOTimestamp(), id: uuID, quizTitle: storedQuiz.quizTitle, facts: storedQuiz.facts)
    
    
    
    UserQuizzesFileManager.addEntry(quiz: myQuiz)
  }
  
}
