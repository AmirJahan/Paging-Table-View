import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
   
    
    @IBOutlet weak var myTableView: UITableView!
    // this table view has a property in storyboard called paging enabled,
    // that has been set to trur
    
    
    var previousPage: NSInteger = 0;


    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int
    {
        return 10;
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // you have use the custom cell
        // leave the delete feature of the cells for later
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        cell.textLabel?.text = "Miow";
        
        return cell;
    }
    

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
        tableViewFinishedScrolling(tableScrollView: scrollView);
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool)
    {
        if (!decelerate)
        {
            tableViewFinishedScrolling(tableScrollView: scrollView);
        }
    }
    
    func tableViewFinishedScrolling (tableScrollView: UIScrollView)
    {
        let pageHeight: CGFloat = tableScrollView.frame.size.height;
        let fractionalPage: Float = Float(tableScrollView.contentOffset.y / pageHeight);
        let page: NSInteger = lround(Double(fractionalPage));
        if (previousPage != page)
        {
            previousPage = page;
            
            let selectedRow = myTableView.indexPathsForVisibleRows?.first;
            print(selectedRow as Any);
        }
    }
    
}

