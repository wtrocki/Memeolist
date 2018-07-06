import Apollo
import UIKit

class MemesListViewController: UITableViewController {

    var memes: [AllMemesQuery.Data.Meme]? {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 64
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        loadData()
    }

    // MARK: - Data loading

    var watcher: GraphQLQueryWatcher<AllMemesQuery>?

    func loadData() {
        watcher = SyncService.instance.client.watch(query: AllMemesQuery()) { result, error in
            if let error = error {
                NSLog("Error while fetching query: \(error.localizedDescription)")
                return
            }

            self.memes = result?.data?.memes
        }
        watcher?.refetch();
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MemesTableViewCell else {
            fatalError("Could not dequeue PostTableViewCell")
        }

        guard let meme = memes?[indexPath.row] else {
            fatalError("Could not find post at row \(indexPath.row)")
        }

        cell.configure(with: meme.fragments.memeDetails)

        return cell
    }
}
