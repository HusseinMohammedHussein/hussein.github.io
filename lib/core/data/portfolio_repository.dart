import '../models/portfolio_models.dart';

/// Content access for the site.
///
/// Today this is local/static data. A future dashboard can keep the same
/// contract and load from Supabase without rewriting UI widgets.
abstract class PortfolioRepository {
  Future<PortfolioContent> load();
}
