import 'package:flutter/material.dart';
import '../models/customer.dart';
import '../utils/theme.dart';

class CustomerCard extends StatelessWidget {
  final Customer customer;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const CustomerCard({
    super.key,
    required this.customer,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: onEdit,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with name and SMS consent indicator
              Row(
                children: [
                  Expanded(
                    child: Text(
                      customer.name,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                  if (customer.smsConsent)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.secondaryGreen.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.sms,
                            size: 14.0,
                            color: AppTheme.secondaryGreen,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            'SMS',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppTheme.secondaryGreen,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16.0),

              // Contact Information
              _buildInfoRow(
                context,
                icon: Icons.phone,
                label: 'Mobile',
                value: customer.mobile,
              ),
              const SizedBox(height: 8.0),
              _buildInfoRow(
                context,
                icon: Icons.email,
                label: 'Email',
                value: customer.email,
              ),
              const SizedBox(height: 8.0),
              _buildInfoRow(
                context,
                icon: Icons.location_on,
                label: 'Location',
                value: customer.location,
              ),

              const SizedBox(height: 20.0),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (onEdit != null)
                    TextButton.icon(
                      onPressed: onEdit,
                      icon: Icon(
                        Icons.edit,
                        size: 18.0,
                        color: theme.colorScheme.primary,
                      ),
                      label: Text(
                        'Edit',
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                      ),
                    ),
                  if (onDelete != null) ...[
                    const SizedBox(width: 8.0),
                    TextButton.icon(
                      onPressed: onDelete,
                      icon: Icon(
                        Icons.delete,
                        size: 18.0,
                        color: theme.colorScheme.error,
                      ),
                      label: Text(
                        'Delete',
                        style: TextStyle(
                          color: theme.colorScheme.error,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20.0,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2.0),
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
